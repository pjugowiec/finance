package annotation;

import org.springframework.test.context.jdbc.Sql;

import java.lang.annotation.Retention;

import static java.lang.annotation.RetentionPolicy.RUNTIME;
import static org.springframework.test.context.jdbc.Sql.ExecutionPhase.BEFORE_TEST_METHOD;

@Retention(RUNTIME)
@Sql(scripts = {"/sql/truncate.sql", "/sql/security.sql",
        "/sql/category.sql", "/sql/currency.sql", "/sql/balance.sql"}, executionPhase = BEFORE_TEST_METHOD)
public @interface SqlBalance {
}
