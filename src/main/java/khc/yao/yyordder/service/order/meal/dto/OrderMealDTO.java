package khc.yao.yyordder.service.order.meal.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import khc.yao.yyordder.common.YYOrderConstant;
import khc.yao.yyordder.common.dto.BasicResponseDTO;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class OrderMealDTO extends BasicResponseDTO {

    public OrderMealDTO() {
        super();
        setSuccess(YYOrderConstant.TRUE);
    }
}
