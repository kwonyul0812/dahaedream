package com.dahaedream.point.model;

import lombok.Data;

@Data
public class Point {

   private int member_id;
   private int target_id;
   private String point_type;
   private int change_amount;
   private int point;
   private int balance_after;
   private String updatetime;

}
