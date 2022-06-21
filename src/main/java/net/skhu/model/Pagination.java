package net.skhu.model;

import lombok.Data;

@Data
public class Pagination {
    int pg = 1;        // 현재 페이지
    int sz = 15;       // 페이지 당 레코드 수
    int li = 0;        // locationId
    int ti = 0;        // tagId
    int mi = 0;        // moodId
    int pi = 0;        // partyId
    int recordCount;   // 전체 레코드 수

    public String getQueryString() {
        return String.format("pg=%d&sz=%d&li=%d&ti=%d&mi=%d&pi=%d", pg, sz, li, ti, mi, pi);
    }
}

