package khc.yao.yyordder.controller.order.meal;

import khc.yao.yyordder.service.order.meal.OrderMealService;
import khc.yao.yyordder.service.order.meal.dto.OrderMealDTO;
import khc.yao.yyordder.service.shopping.cart.ShoppingCartService;
import khc.yao.yyordder.service.shopping.cart.dto.ShoppingCartDTO;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Validated
@RestController
@RequestMapping("/api")
public class OrderMealController {
    private final OrderMealService service;

    public OrderMealController(OrderMealService service) {
        this.service = service;
    }

    @PostMapping("/order/meal")
    public OrderMealDTO addOrder(
            int shoppingCartID,
            String orderer,
            String meal,
            String remark,
            int money,
            String password) {
        service.saveOrderMeal(shoppingCartID, orderer, meal, remark, password, money);
        return new OrderMealDTO();
    }

    @DeleteMapping("/order/meal/{orderNumber}")
    public OrderMealDTO deleteOrder(@PathVariable(value = "orderNumber") int orderNumber) {
        service.deleteOrderMeal(orderNumber);
        return new OrderMealDTO();
    }
}
