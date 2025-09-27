package com.example.api;

import com.intuit.karate.junit5.Karate;

class InventoryTest {

    @Karate.Test
    Karate testInventory() {
        return Karate.run("classpath:features/inventory.feature");
    }
}
