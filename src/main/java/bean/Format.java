package bean;

import java.text.DecimalFormat;
import java.time.LocalDateTime;

public class Format {
    private static DecimalFormat decimalFormat = new DecimalFormat("###,###");

    public static String format(int num) {
        return decimalFormat.format(num).replace(",", ".");
    }

    public static String formatDate(LocalDateTime date) {
        return date.getDayOfMonth() + "/" + date.getMonthValue() + "/" + date.getYear();
    }
}
