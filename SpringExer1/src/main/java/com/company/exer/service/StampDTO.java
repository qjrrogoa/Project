package com.company.exer.service;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StampDTO {
	String rvNo;
	String rvLat;
	String rvLng;
	String stNo;
	Date stDate;
	String rvTitle;
}
