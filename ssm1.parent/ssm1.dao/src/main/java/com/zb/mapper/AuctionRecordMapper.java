package com.zb.mapper;

import com.zb.entity.AuctionRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AuctionRecordMapper {
    public List<AuctionRecord> findAuctionRecord(@Param("aid") Integer aid);

    public int findMaxPrice(@Param("aid") Integer id);

    public int insertAuctionRecord(AuctionRecord auctionRecord);

    public List<AuctionRecord> findEndList();

    public List<AuctionRecord> findStartList();

    public List<AuctionRecord> findAuctionByAid(@Param("aid") Integer aid);
}
