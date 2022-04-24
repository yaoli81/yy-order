package khc.yao.yyordder.controller.freemarker;

import khc.yao.yyordder.service.order.drink.OrderDrinkService;
import khc.yao.yyordder.service.order.drink.persistent.OrderDrinkPO;
import khc.yao.yyordder.service.order.meal.OrderMealService;
import khc.yao.yyordder.service.order.meal.persistent.OrderMealPO;
import khc.yao.yyordder.service.shopping.cart.ShoppingCartService;
import khc.yao.yyordder.service.shopping.cart.persistent.ShoppingCartPO;
import khc.yao.yyordder.service.store.StoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/history/order")
public class HistoryOrder {
    @Autowired
    private ShoppingCartService shoppingCartService;
    @Autowired
    private StoreService storeService;
    @Autowired
    private OrderMealService orderMealService;
    @Autowired
    private OrderDrinkService orderDrinkService;

    @GetMapping(value = {"/{shoppingCartID}"})
    public String index(ModelMap map, @PathVariable(value = "shoppingCartID") Integer shoppingCartID) {
        Optional<ShoppingCartPO> OptionalPO = shoppingCartService.getShoppingCartByID(shoppingCartID);
        if (OptionalPO.isPresent()) {
            ShoppingCartPO po = OptionalPO.get();
            map.addAttribute("shoppingCartPO", po);

            if ("meal".equals(po.getKind())) {
                List<OrderMealPO> orderMealPOList = orderMealService.getOrderByID(po.getShoppingCartID());
                map.addAttribute("orderMealPOList", orderMealPOList);
                int totalPrice = 0;
                for (OrderMealPO mealPO : orderMealPOList) {
                    totalPrice += mealPO.getMoney();
                }
                map.addAttribute("totalPrice", totalPrice);
                map.addAttribute("totalSize", orderMealPOList.size());
            } else {
                List<OrderDrinkPO> orderDrinkPOList = orderDrinkService.getOrderByID(po.getShoppingCartID());
                map.addAttribute("orderDrinkPOList", orderDrinkPOList);
                int totalPrice = 0;
                for (OrderDrinkPO drinkPO : orderDrinkPOList) {
                    totalPrice += drinkPO.getMoney();
                }
                map.addAttribute("totalPrice", totalPrice);
                map.addAttribute("totalSize", orderDrinkPOList.size());
            }

            return "/historyOrder";
        } else {
            return "/index";
        }
    }
}
