package com.zb.service.impl;

import com.zb.entity.AuctionRecord;
import com.zb.mapper.AuctionRecordMapper;
import com.zb.service.AuctionRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AuctionRecordServiceImpl implements AuctionRecordService {
    @Autowired
    private AuctionRecordMapper auctionRecordMapper;

    @Override
    public List<AuctionRecord> findAuctionRecord(Integer aid) {
        return auctionRecordMapper.findAuctionRecord(aid);
    }

    @Override
    public int findMaxPrice(Integer id) {
        return auctionRecordMapper.findMaxPrice(id);
    }

    @Override
    public int insertAuctionRecord(AuctionRecord auctionRecord) {
        return auctionRecordMapper.insertAuctionRecord(auctionRecord);
    }

    @Override
    public List<AuctionRecord> findEndList() {
        return auctionRecordMapper.findEndList();
    }

    @Override
    public List<AuctionRecord> findAuctionByAid(Integer aid) {
        return auctionRecordMapper.findAuctionByAid(aid);
    }


}
