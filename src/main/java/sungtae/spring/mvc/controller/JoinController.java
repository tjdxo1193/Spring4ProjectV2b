package sungtae.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import sungtae.spring.mvc.service.MemberService;
import sungtae.spring.mvc.util.GoogleCaptchaUtil;
import sungtae.spring.mvc.vo.MemberVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@Controller
public class JoinController {

    // @Autowired
    // private MemberService msrv;
    // @Autowired
    // private GoogleCaptchaUtil gcutil;

    private MemberService msrv;
    private GoogleCaptchaUtil gcutil;

    @Autowired
    public JoinController(MemberService msrv, GoogleCaptchaUtil gcutil) {
        this.msrv = msrv;
        this.gcutil = gcutil;
    }

    @GetMapping("/join/agree")
    public String agree() {
        return "join/agree.tiles";
    }

    @GetMapping("/join/checkme")
    public String checkme() {
        return "join/checkme.tiles";
    }

    @GetMapping("/join/joinme")  // 회원가입 폼
    public String joinme() {
        return "join/joinme.tiles";
    }

    // 회원가입시 입력한 정보는 MemberVO 객체에 저장됨
    // 하지만, 클라이언트에서는 회원정보와 상관없는 데이터를 보낸 경우
    // HttpServletRequest 객체를 이용해서 처리함
    // 물론, MemberVO 객체에 같이 정의해서 사용해도 됨

    // Model/ModelAttribute/ModelAndView
    // 뷰에 사용자 데이터를 보내고 싶을때 사용하는 객체들
    // 단, 데이터는 request 객체에 1회성으로 저장됨

    // RedirectAttribute
    // 리다이렉트된 뷰에 사용자 데이터를 보내고 싶을때 사용하는 객체
    // 단, 데이터는 session 객체에 1회성으로 저장됨
    @PostMapping("/join/joinme")  // 회원가입 처리
    public String joinmeok(MemberVO mvo,
                           HttpServletRequest req,
                           RedirectAttributes rds)
            throws UnsupportedEncodingException {
        // 질의 문자열에 한글을 포함시키려면
        // 반드시 URLEncoder 를 이용해서 한글에 대한 적절한 인코딩이 필요!
        //
        String param = "?name=" + URLEncoder.encode(mvo.getName(), "UTF-8");
        param += "&jumin1=" + mvo.getJumin().split("-")[0];
        param += "&jumin2=" + mvo.getJumin().split("-")[1];
        String returnPage = "redirect:/join/joinme" + param;

        // 클라이언트에서 생성한 captcha 코드를 가져옴
        String gCaptcha = req.getParameter("g-recaptcha");

        // captcha 코드의 유효성을 확인함
        // 결과 : true => 테이블에 회원정보 저장, /join/joinok 이동
        // 결과 : false => /join/joinme 이동
        if (gcutil.checkCaptcha(gCaptcha)){
            msrv.newMember(mvo);
            returnPage = "redirect:/join/joinok";
        } else {
            rds.addFlashAttribute("ckeckCaptcha", "자동가입방지 확인이 실패했어요!!");
        }

        return returnPage;
    }

    @GetMapping("/join/joinok")
    public String joinok() {
        return "join/joinok.tiles";
    }

    // 우편번호 검색
    // /join/zipcode?dong=동이름
    // 검색된 결과를 뷰페이지 없이 바로 응답으로 출력 : REST
    // 서블릿에서 제공하는 HttpServletResponse 객체를 이용하면
    // 스프링의 뷰리졸버 없이 응답을 출력할 수 있음
    // 결과는 자바스크립트 ajax로 적절히 가공해서 폼에 출력
    @ResponseBody
    @GetMapping("/join/zipcode")
    public void zipcode(String dong, HttpServletResponse res) {
        try {
            // 응답결과의 유형은 json 으로 설정
            res.setContentType("application/json; charset=UTF-8");

            // 응답결과를 브라우져로 보냄
            res.getWriter().print(msrv.findZipcode(dong));
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    // 아이디 중복체크
    // /join/checkuid?uid=아이디
    // 사용 가능 아이디 : 0
    // 사용 불가 아이디(다른 사람이 사용중) : 1
    @ResponseBody
    @GetMapping("/join/checkuid")
    public void checkuid(String uid,
                         HttpServletResponse res) {
        try {
            res.getWriter().print(msrv.checkUserid(uid));
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
}
