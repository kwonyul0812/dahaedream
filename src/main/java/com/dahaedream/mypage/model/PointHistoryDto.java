package com.dahaedream.mypage.model;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Getter
@Setter
public class PointHistoryDto {
    private Integer pointHistoryId;
    private Integer memberId;
    private Integer targetId;
    private String nickname;
    private String pointType; // 출금, 입금, 충전
    private Integer changeAmount;
    private Integer balanceAfter;
    private LocalDateTime updateTime;

    private String formattedUpdateTime;

    public void setFormattedUpdateTime() {
        if (updateTime != null) {
            this.formattedUpdateTime = updateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        } else {
            this.formattedUpdateTime = "";
        }
    }
}
