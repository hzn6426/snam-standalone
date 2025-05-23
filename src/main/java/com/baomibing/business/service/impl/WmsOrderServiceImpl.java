package com.baomibing.business.service.impl;

import com.baomibing.authority.dto.GroupDto;
import com.baomibing.authority.dto.UserGroupDto;
import com.baomibing.authority.service.SysGroupService;
import com.baomibing.authority.service.SysUserGroupService;
import com.baomibing.business.constant.UserTag;
import com.baomibing.business.dto.WmsOrderDto;
import com.baomibing.business.entity.WmsOrder;
import com.baomibing.business.mapper.WmsOrderMapper;
import com.baomibing.business.service.WmsOrderService;
import com.baomibing.core.annotation.Action;
import com.baomibing.core.annotation.ActionConnect;
import com.baomibing.core.common.SearchResult;
import com.baomibing.orm.base.MBaseServiceImpl;
import com.baomibing.tool.constant.Formats;
import com.baomibing.tool.constant.Strings;
import com.baomibing.tool.util.CharacterUtil;
import com.baomibing.tool.util.Checker;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.google.common.collect.Sets;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.RoundingMode;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * WmsOrderServiceImpl
 *
 * @author frog 2023/7/13 10:14
 * @version 1.0.0
 **/
@Service
public class WmsOrderServiceImpl extends MBaseServiceImpl<WmsOrderMapper, WmsOrder, WmsOrderDto> implements WmsOrderService {

    @Autowired private SysGroupService groupApi;
    @Autowired private SysUserGroupService userGroupService;

    @Action(value = "ORDER_SEARCH")
    @ActionConnect(value = {"selectList","selectCount"},
            userAuthColumn= {UserTag.SERVICE + Strings.HASH + "service_code", UserTag.SALLER + Strings.HASH + "seller_code"},
            groupAuthColumn = {UserTag.SERVICE + Strings.HASH + "service_code", UserTag.SALLER + Strings.HASH + "seller_code"})
    @Override
    public SearchResult<WmsOrderDto> search(WmsOrderDto v, int pageNo, int pageSize) {
        LambdaQueryWrapper<WmsOrder> wrapper = lambdaQuery();
        wrapper.like(Checker.beNotEmpty(v.getCode()), WmsOrder::getCode, v.getCode())
                .ge(Checker.beNotNull(v.getStart()), WmsOrder::getCreateTime, v.getStart())
                .le(Checker.beNotNull(v.getEnd()), WmsOrder::getCreateTime, v.getEnd())
                .eq(Checker.beNotEmpty(v.getSellerCode()), WmsOrder::getSellerCode, v.getServiceCode());
        SearchResult<WmsOrderDto> result = search(wrapper, pageNo, pageSize);
        List<GroupDto> companys = groupApi.listBranchCompanines();
        Map<String, String> groupmap = companys.stream().collect(Collectors.toMap(GroupDto::getId, GroupDto::getGroupName));
        result.getDataList().forEach(r -> {
            String key = groupmap.keySet().stream().filter(k -> r.getGroupId().startsWith(k)).findFirst().orElse(null);
            if (Checker.beNotEmpty(key)) {
                r.setCompanyName(groupmap.get(key));
            }
        });
        return result;
    }

    @Override
    public void saveOrder(WmsOrderDto order) {
        checkArgument(order);
        checkArgument(order.getServiceCode(), order.getSellerCode());
        DateTime dateTime = new DateTime();
        Integer count = baseMapper.getCountOrdersByMonth(dateTime.toString(Formats.DEFAULT_MONTH_FORMAT));
        String code = "O" + dateTime.toString(Formats.yearMonth) + CharacterUtil.leftPadSomeChars(String.valueOf(count), 4, "0");
        order.setMoney(order.getPrice().multiply(order.getQuantity()).setScale(2, RoundingMode.HALF_UP));
        order.setCode(code).setGroupId(order.getServiceCode().split(Strings.HASH)[0]);
//        List<UserGroupDto> userGroups = userGroupService.listByUserNos(Sets.newHashSet(order.getServiceCode(), order.getSellerCode()));
//        Map<String, String> ugMap = userGroups.stream().collect(Collectors.toMap(UserGroupDto::getUserNo, UserGroupDto::getGroupId));
//        order.setServiceCode(ugMap.get(order.getServiceCode()) + Strings.HASH + order.getServiceCode());
//        order.setSellerCode(ugMap.get(order.getSellerCode()) + Strings.HASH + order.getSellerCode());
        super.saveIt(order);
    }

    @Action(value = "ORDER_UPDATE")
    @ActionConnect(value = "updateById")
    @Override
    public void updateOrder(WmsOrderDto order) {
//        String serviceCode = PermUtil.parseGroup(order.getServiceCode()), sellerCode = PermUtil.parseUser(order.getSellerCode());
//        List<UserGroupWrapDto> userGroups = groupApi.listUserGroupByUserNos(Sets.newHashSet(serviceCode, sellerCode));
//        Map<String, String> ugMap = userGroups.stream().collect(Collectors.toMap(UserGroupWrapDto::getUserNo, UserGroupWrapDto::getGroupId));
//        order.setServiceCode(ugMap.get(serviceCode) + Strings.HASH + serviceCode);
//        order.setSellerCode(ugMap.get(sellerCode) + Strings.HASH + sellerCode);
        order.setMoney(order.getPrice().multiply(order.getQuantity()).setScale(2, RoundingMode.HALF_UP));
        super.updateIt(order);
    }

    @Action(value = "ORDER_DELETE")
    @ActionConnect(value = "deleteBatchIds")
    @Override
    public void deleteOrders(Set<String> ids) {
        super.deletes(ids);
    }

    @Override
    public WmsOrderDto getOrder(String id) {
        return getIt(id);
    }
}
