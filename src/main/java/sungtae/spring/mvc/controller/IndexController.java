package sungtae.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import sungtae.spring.mvc.service.MemberService;
import sungtae.spring.mvc.vo.MemberVO;

import javax.servlet.http.HttpSession;

@Controller
public class IndexController {

    @Autowired
    private MemberService msrv;

    @GetMapping("/index")
    public String index() {
        return "index.tiles";
    }

    // 로그인 체크기능
    // 입력한 아이디/비밀번호로 로그인 가능여부 확인
    // 로그인 성공시 로그인 여부를 시스템에 저장하기 위해
    // HttpSession 객체를 이용함
    // 즉, 서버가 생성한 정보를 일정기간 동안
    // WAS에 저장해두고 필요할 때마다 이것을 활용함으로써
    // 로그인한 사용자를 식별할 수 있음
    @PostMapping("/login/login")
    public String loginok(MemberVO mvo, HttpSession sess) {
        String returnPage = "redirect:/login/loginfail";

        if (msrv.checkLogin(mvo, sess))  // 로그인 성공시
            returnPage = "redirect:/index";

        return returnPage;
    }

    // 로그인 성공시 로그인여부를 세션객체로 만들어 두었음
    // 로그아웃시에는 이 세션객체를 지워버리면 됨
    @GetMapping("/login/logout")
    public String logout(HttpSession sess) {

        // 세션객체를 서버에서 제거함
        sess.invalidate();

        return "redirect:/index";
    }

    // 로그인 실패시 처리
    @GetMapping("/login/loginfail")
    public String fail() {
        return "fail.tiles";
    }

}
