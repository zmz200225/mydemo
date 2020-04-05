package com.zb.entity;

public class AuctionRecord {
    private Integer id;
    private User user;
    private Auction auction;
    private String auctionTime;
    private Float auctionPrice;

    public Auction getAuction() {
        return auction;
    }

    public void setAuction(Auction auction) {
        this.auction = auction;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getAuctionTime() {
        return auctionTime;
    }

    public void setAuctionTime(String auctionTime) {
        this.auctionTime = auctionTime;
    }

    public Float getAuctionPrice() {
        return auctionPrice;
    }

    public void setAuctionPrice(Float auctionPrice) {
        this.auctionPrice = auctionPrice;
    }
}
