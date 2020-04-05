package com.zb.util;

import java.util.List;

public class PageUtil<T> {
    private Integer index;
    private Integer size;
    private Integer count;
    private Integer total;
    private List<T> data;

    public Integer getIndex() {
        return index;
    }

    public void setIndex(Integer index) {
        this.index = index;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getTotal() {
        this.total = this.count % size == 0 ? this.count / this.size : this.count / this.size + 1;
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }
}
