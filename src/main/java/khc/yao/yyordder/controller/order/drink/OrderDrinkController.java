package khc.yao.yyordder.controller.order.drink;

import khc.yao.yyordder.service.order.drink.OrderDrinkService;
import khc.yao.yyordder.service.order.meal.dto.OrderMealDTO;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@Validated
@RestController
@RequestMapping("/api")
public class OrderDrinkController {
    private final OrderDrinkService service;

    public OrderDrinkController(OrderDrinkService service) {
        this.service = service;
    }

    @PostMapping("/order/drink")
    public OrderMealDTO addOrder(
            int shoppingCartID,
            String orderer,
            String drink,
            String size,
            String sugar,
            String ice,
            String remark,
            int money,
            String password) {
        service.saveOrderDrink(shoppingCartID, orderer, drink, size, sugar, ice, remark, password, money);
        return new OrderMealDTO();
    }

    @DeleteMapping("/order/drink/{orderNumber}")
    public OrderMealDTO deleteOrder(@PathVariable(value = "orderNumber") int orderNumber) {
        service.deleteOrderMeal(orderNumber);
        return new OrderMealDTO();
    }
}
