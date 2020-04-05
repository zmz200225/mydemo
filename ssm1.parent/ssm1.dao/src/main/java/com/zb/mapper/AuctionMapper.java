package com.zb.mapper;

import com.zb.entity.Auction;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface AuctionMapper {
    public List<Auction> findAuctionPage(Map<String, Object> params);

    public int findAuctionCount(Map<String, Object> params);

    public int insertAuction(Auction auction);

    public int deleteAuction(@Param("id") Integer id);

    public Auction findAuctionById(@Param("id") Integer id);

    public int updateAuction(Auction auction);

    public List<Auction> startAuctionList();
}
