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
    public BoardController(BoardService bsrv,
                           GoogleCaptchaUtil gcutil) {
        this.bsrv = bsrv;
        this.gcutil = gcutil;
        this.brsrv = brsrv;
    }

    // 게시판 목록 처리 1 : 페이징
    // ex) 총 게시글 수counts : 101
    // 페이지당 출력 게시글 수perpage : 10
    // 총 페이지 수pages는? : 11
    // => pages = counts / perpage

    // 게시물의 번호 범위 : 101 ~ 1
    // 구현코드 : select ??? from Board limit startnum, perpage
    // 1page에 출력할 게시물의 범위 : 0 ~ 9
    // 2page에 출력할 게시물의 범위 : 10 ~ 19
    // 3page에 출력할 게시물의 범위 : 20 ~ 29
    // => 특정 페이지page에 속하는 게시물의 시작범위startnum 산출식?
    // startnum = (page - 1) * 10


    // 게시판 목록 처리 2 : 검색처리
    @GetMapping("/board/list")  // 게시판 목록 출력
    public ModelAndView list(ModelAndView mv, String cp) {
        // if (cp == null) cp = "1";
        // header.jsp에 ?cp=1를 추가했기 때문에 더이상 필요없음

        mv.setViewName("board/list.tiles");
        mv.addObject("bds", bsrv.readBoard(cp));
        mv.addObject("bdcnt", bsrv.countBoard());

        return mv;
    }


    @GetMapping("/board/view")  // 게시판 본문글 출력
    public ModelAndView view(String bno, ModelAndView mv) {
        mv.setViewName("board/view.tiles");

        mv.addObject("bd", bsrv.readOneBoard(bno));
        mv.addObject("rp", brsrv.readReply(bno));
        bsrv.viewCountBoard(bno);    // 조회수 증가

        return mv;
    }


    @GetMapping("/board/write") // 새글쓰기 폼
    public String write(HttpSession sess) {
        String returnPage = "redirect:/index";

        // 로그인 했으면 새글쓰기 폼 출력
        if (sess.getAttribute("UID") != null)
            returnPage = "board/write.tiles";

        return returnPage;
    }


    @PostMapping("/board/write")  // 새글쓰기 처리
    public String writeok(BoardVO bvo, HttpSession sess) {
        String returnPage = "redirect:/board/write";

        // 로그인한 사용자라면 새글쓰기 허용
        if (sess.getAttribute("UID") != null && bsrv.newBoard(bvo))
            returnPage = "redirect:/board/list?cp=1";

        return returnPage;
    }


    @GetMapping("/board/update")  // 수정하기 폼
    public ModelAndView update(
            String bno, ModelAndView mv, HttpSession sess) {

        // 로그인 했으면 수정하기 폼 출력
        if (sess.getAttribute("UID") != null && bno != null) {
            mv.setViewName("board/update.tiles");
            mv.addObject("bd", bsrv.readOneBoard(bno));
        } else {
            mv.setViewName("redirect:/index");
        }

        return mv;
    }

    @PostMapping("/board/update")  // 수정하기 완료
    public String updateok(BoardVO bvo, String cp,
                           HttpSession sess, String userid) {
        String param = "?bno=" + bvo.getBno() + "&cp=" + cp;

        String returnPage = "redirect:/board/update" + param;

        // 로그인한 사용자이면서 수정하려는 글이 자신이 쓴것이라면
        if (sess.getAttribute("UID").equals(userid) &&
                bsrv.modifyBoard(bvo)) {
            returnPage = "redirect:/board/view" + param;
        }

        return returnPage;
    }

    @GetMapping("/board/delete")
    public String delete(String bno, String cp,
                         HttpSession sess, String userid) {
        // 추가적으로 작성해야 하는 코드 : 보안측면
        // 삭제하려면 로그인 필요
        // 또한, 자기가 작성한 글만 삭제 가능
        if (sess.getAttribute("UID").equals(userid))
            bsrv.removeBoard(bno);

        return "redirect:/board/list?cp=" + cp;
    }

    @GetMapping("/board/find") // 검색기능
    // 게시물 검색기능을 위한 url 호출 방법 : /board/find?findtype=title&findkey=기생충&cp=1
    public ModelAndView find(ModelAndView mv, String cp, String findtype, String findkey){
        mv.setViewName("board/list.tiles");
        mv.addObject("bds", bsrv.readBoard(cp, findtype, findkey));
        mv.addObject("bdcnt", bsrv.countBoard(findtype, findkey));
        return mv;
    }

}
