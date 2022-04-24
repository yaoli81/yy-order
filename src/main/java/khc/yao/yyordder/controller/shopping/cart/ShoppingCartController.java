package khc.yao.yyordder.controller.shopping.cart;

import khc.yao.yyordder.service.shopping.cart.ShoppingCartService;
import khc.yao.yyordder.service.shopping.cart.dto.ShoppingCartDTO;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Validated
@RestController
@RequestMapping("/api/shopping/cart")
public class ShoppingCartController {
    private final ShoppingCartService service;

    public ShoppingCartController(ShoppingCartService service) {
        this.service = service;
    }

    @PostMapping("/add")
    public ShoppingCartDTO getResult(
            String mealType,
            String store,
            String owner,
            String timeType,
            String quickTime,
            String customizeOpenTime,
            String customizeEndTime) {
        service.saveShoppingCart(mealType, owner, store, timeType, quickTime, customizeOpenTime, customizeEndTime);
        return new ShoppingCartDTO();
    }
}
