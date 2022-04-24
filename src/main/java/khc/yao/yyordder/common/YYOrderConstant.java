package khc.yao.yyordder.common;

public final class YYOrderConstant {
    /***
     * 私有建構子，不讓外部呼叫
     */
    private YYOrderConstant() {}

    public static final String TRUE = "true";
    public static final String FALSE = "false";

    public static final String SUCCESS = "成功";
    public static final String FAIL = "失敗";

    // Database Schema
    public static final String DATABASE_SCHEMA = "yy_order";
    // Database Table
    public static final String TBL_SHOPPING_CART = "shopping_cart";
    public static final String TBL_ORDER_MEAL = "order_meal";
    public static final String TBL_ORDER_DRINK = "order_drink";
    public static final String TBL_STORE = "store";
}
