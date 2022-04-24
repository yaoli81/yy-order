package khc.yao.yyordder.controller.store;

import khc.yao.yyordder.service.shopping.cart.dto.ShoppingCartDTO;
import khc.yao.yyordder.service.store.StoreService;
import khc.yao.yyordder.service.store.dto.StoreDTO;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Validated
@RestController
@RequestMapping("/api/store")
public class StoreController {
    private final StoreService service;

    public StoreController(StoreService service) {
        this.service = service;
    }

    @PostMapping("/add")
    public StoreDTO getResult(
            String mealType,
            String store,
            String menuLink) {
        service.saveStore(mealType, store, menuLink);
        return new StoreDTO();
    }
}
