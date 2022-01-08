package com.server.unit.shared.util;

import com.server.shared.util.SortUtil;
import org.junit.jupiter.api.Test;
import org.springframework.data.domain.Sort;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

final class SortUtilTest {

    @Test
    void reparseSort_DESC_shouldReturnTransactionDate() {
        final String parsedSort = "-date";

        final Sort sort = SortUtil.getSortByParsedSort(parsedSort);

        assertTrue(sort.isSorted());
    }

    @Test
    void reparseSort_ASC_shouldReturnTransactionDate() {
        final String parsedSort = "date";

        final Sort sort = SortUtil.getSortByParsedSort(parsedSort);

        assertTrue(sort.isSorted());
    }
}
