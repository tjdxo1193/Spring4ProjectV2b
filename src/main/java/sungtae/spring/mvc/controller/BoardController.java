package sungtae.spring.mvc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import sungtae.spring.mvc.service.BoardReplyService;
import sungtae.spring.mvc.service.BoardService;
import sungtae.spring.mvc.util.GoogleCaptchaUtil;
import sungtae.spring.mvc.vo.BoardVO;

import javax.servlet.http.HttpSession;


@Controller
public class BoardController {

    private BoardService bsrv;
    private GoogleCaptchaUtil gcutil;
    private BoardReplyService brsrv;

    @Autowired
    public BoardController(BoardService bsrv, GoogleCaptchaUtil gcutil) {
        this.bsrv = bsrv;
        this.gcutil = gcutil;
//        this.brsrv = brsrv;
    }
    // 게시판 목록 처리 1 : 페이징
    // ex) 총게시글 수 : 101
    // 페이지당 출력 게시글 수 : 10
    // 총 페이지 수는? : 11

    // 게시물의 번호 범위 : 101 ~ 1
    // 1page에 출력할 게시물의 범위 : 101 ~ 92
    // 2page에 출력할 게시물의 범위 : 92 ~ 82
    // 3page에 출력할 게시물의 범위 : 82 ~ 72
    // => 특정 페이지page에 속하는 게시물의 시작범위 startnum 산출식?
    // counts - (pages -1 ) * 10
    // 구현 코드 : select ??? from Board limit startnum, pages

    // 게시판 목록 처리 2 : 검색처리
    @GetMapping("/board/list")
    public ModelAndView list(ModelAndView mv, String cp) { // 매개변수로 ModelAndView 객체를 넣으면 스프링에서 알아서 객체 만들어줌
//        if (cp == null) cp = "1";
//        header.jsp에 ?cp=1를 추가했기 때문에 더이사 ㅇ필요없음
        mv.setViewName("board/list.tiles");
        mv.addObject("bds",bsrv.readBoard(cp));
        mv.addObject("bdcnt", bsrv.countBoard());

        return mv;
    }

    @GetMapping("/board/write") // 새글쓰기 폼
    public String write(){
        return "board/write.tiles";
    }

    @PostMapping("/board/write")  // 새글쓰기 처리
    public String writeok(BoardVO bvo, HttpSession sess) {
        String returnPage = "redirect:/board/write";

        if (sess.getAttribute("UID") != null && bsrv.newBoard(bvo))
            returnPage = "redirect:/board/list?cp=1";

        return returnPage;
    }
    @GetMapping("/board/update") // 수정하기 폼
    public ModelAndView update(String bno, String cp, ModelAndView mv){

        mv.setViewName("board/update,tiles");
        mv.addObject("bd", bsrv.readOneBoard(bno));
        return mv;
    }

    @PostMapping("/board/update") // 수정하기 완료
    public String updateok(BoardVO bvo, String cp, HttpSession sess, String userid) {
        String returnPage = "redirect:/board/update";
        // 로그인한 사용자 이면서 수정하려는 글이 자신이 쓴 것이라면
        if (sess.getAttribute("UID").equals(userid) && bsrv.modifyBoard(bvo)) {
            String param = "?bno=" + bvo.getBno();
            param += "&cp=" + cp;
            returnPage = "redirect:/board/view" + param;
        }
        return returnPage;
    }

    @GetMapping("/board/delete")
    public String delete(String bno, String cp,
                         HttpSession sess, String userid){
        // 추가적으로 작성해야 하는 코드 : 보안 측면
        // 삭제하려면 로그인 필요
        // 또한, 자기가 작성한 글만 삭제 가능

        if (sess.getAttribute("UID").equals(userid))
            bsrv.removeBoard(bno);

        return "redirect:/board/list?cp=" + cp;
    }

    @GetMapping("/board/view")  // 회원가입 폼
    public ModelAndView view(String bno, ModelAndView mv) {
        mv.setViewName("board/view.tiles");

        mv.addObject("bd", bsrv.readOneBoard(bno));
        bsrv.viewCountBoard(bno);  //  조회수 증가

        return mv;
    }
}
