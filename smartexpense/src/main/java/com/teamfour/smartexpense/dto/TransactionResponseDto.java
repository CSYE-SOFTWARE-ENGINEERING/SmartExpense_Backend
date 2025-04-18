package com.teamfour.smartexpense.dto;

import com.fasterxml.jackson.annotation.JsonFormat; 
import com.teamfour.smartexpense.model.TransactionType;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.LocalDate;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TransactionResponseDto {
    private Long id;
    private BigDecimal amount;
    private String description;

    @JsonFormat(pattern = "yyyy-MM-dd")  // 以 yyyy-MM-dd 格式返回
    private LocalDate date;

    private TransactionType type;
    private Long walletId;
    private String walletName;
    private Long categoryId;
    private String categoryName;
    private LocalDateTime createdAt;
    private LocalDateTime modifiedAt;
}
