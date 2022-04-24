package khc.yao.yyordder.common.dto;

import khc.yao.yyordder.common.YYOrderConstant;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class BasicResponseDTO {
    private String success;
    private String message;

    public BasicResponseDTO() {
        success = YYOrderConstant.FALSE;
    }
}
