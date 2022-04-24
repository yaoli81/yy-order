package khc.yao.yyordder.service.shopping.cart.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import khc.yao.yyordder.common.YYOrderConstant;
import khc.yao.yyordder.common.dto.BasicResponseDTO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ShoppingCartDTO extends BasicResponseDTO {
//    @Getter @Setter
//    @AllArgsConstructor
//    @JsonInclude(JsonInclude.Include.NON_EMPTY)
//    public static class ShoppingCartBean {
//        @JsonProperty("cbid")
//        private String CBID;
//        @JsonProperty("issue_date")
//        private String issueDate;
//        @JsonProperty("official_issue")
//        private String officialIssue;
//        @JsonProperty("close_time")
//        private String closeTime;
//    }

//    private ShoppingCartBean data;

    public ShoppingCartDTO() {
        super();
        setSuccess(YYOrderConstant.TRUE);
    }
}
