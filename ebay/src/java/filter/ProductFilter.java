package filter;

import constant.IConstant;
import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.AccountDTO;

public class ProductFilter implements Filter {

    @Override
    public void doFilter(ServletRequest rq, ServletResponse rp,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) rq;
        HttpServletResponse response = (HttpServletResponse) rp;
        HttpSession session = request.getSession();
        AccountDTO account = (AccountDTO) session.getAttribute("account");

        String action = request.getParameter("action");
        if (action == null || action.isEmpty() || action.isBlank()) {
            action = "read";
        }
        switch (action) {
            case "read":
            case "search":
                chain.doFilter(rq, rp);
                break;
            default:
                if (account != null && account.getRole().equals(IConstant.ADMIN)) {
                    chain.doFilter(rq, rp);
                } else {
                    response.sendRedirect(IConstant.HOME_PAGE);
                }
        }
    }

}
