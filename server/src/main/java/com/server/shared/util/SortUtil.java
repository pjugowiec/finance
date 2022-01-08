package com.server.shared.util;

import com.server.shared.exceptions.ValidationException;
import lombok.NoArgsConstructor;
import org.apache.logging.log4j.util.Strings;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;

import java.util.Map;

import static lombok.AccessLevel.PRIVATE;

@NoArgsConstructor(access = PRIVATE)
public final class SortUtil {
    private static final String DASH = "-";
    private static final Map<String, String> SORT_ENTITY = Map.of(
            "amount", "balance",
            "category", "categoryEntity.value",
            "date", "transactionDate"
    );

    public static Sort getSortByParsedSort(final String parsedSort) {
        if(parsedSort == null || parsedSort.isEmpty()) return Sort.by("date");

        String reparsedString = parsedSort;
        boolean desc = false;
        if(parsedSort.contains(DASH)) {
            desc = true;
            reparsedString= reparsedString.replace(DASH, Strings.EMPTY);
        }

        reparsedString = SORT_ENTITY.get(reparsedString);
        if(reparsedString == null) {
            throw new ValidationException(CommonErrorMessage.SORT_ERROR.name());
        }

        return Sort.by(desc ? Direction.DESC :Direction.ASC, reparsedString);

    }

}
