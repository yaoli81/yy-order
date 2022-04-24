package khc.yao.yyordder.common.util;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

public class TimeUtil {
    public static LocalDateTime getNow() {
        return LocalDateTime.now(ZoneId.of("Hongkong"));
    }

    public static DateTimeFormatter getStandardDateTimeFormatter() {
        return DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    }

    // 取得當天的 YearMonth，如 202201
    public static String getCurrentYearMonth() {
        return DateTimeFormatter.ofPattern("yyyyMM").format(getNow());
    }

    // 取得上個月的 YearMonth，如 202112
    public static String getLastYearMonth() {
        return DateTimeFormatter.ofPattern("yyyyMM").format(getNow().minusMonths(1));
    }

    // 取得下個月的 YearMonth，如 202202
    public static String getNextYearMonth() {
        return DateTimeFormatter.ofPattern("yyyyMM").format(getNow().plusMonths(1));
    }
}
