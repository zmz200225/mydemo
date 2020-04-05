package com.zb.service;

import com.zb.entity.AuctionRecord;

import java.util.List;

public interface AuctionRecordService {
    public List<AuctionRecord> findAuctionRecord(Integer aid);

    public int findMaxPrice(Integer id);

    public int insertAuctionRecord(AuctionRecord auctionRecord);

    public List<AuctionRecord> findEndList();

    public List<AuctionRecord> findAuctionByAid(Integer aid);
}
