package com.avengors.entity.air;

import java.util.List;

public class AirResponse {
    private List<Item> items;

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public AirResponse(List<Item> items) {
        this.items = items;
    }
}
