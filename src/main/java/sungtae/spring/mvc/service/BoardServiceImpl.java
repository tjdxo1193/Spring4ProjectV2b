package sungtae.spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sungtae.spring.mvc.dao.BoardDAO;
import sungtae.spring.mvc.vo.BoardVO;

import java.util.List;

@Service("bsrv")
public class BoardServiceImpl implements BoardService{

    @Autowired private BoardDAO bdao;

    @Override
    public boolean newBoard(BoardVO bvo) {
        boolean isOk = false;

        // 줄바꿈기호를 <br>로 변환작업 필요할 수도 있음
        // 지금 예제에서는 뷰단에서 변환작업을 수행하도록 작성함
        int cnt = bdao.insertBoard(bvo);
        if (cnt > 0) isOk = true;

        return isOk;
    }

    @Override
    public List<BoardVO> readBoard(String cp) {
        int snum = (Integer.parseInt(cp)-1) * 10;

        return bdao.selectBoard(snum);
    }

    @Override
    public BoardVO readOneBoard(String bno) {
        return bdao.selectOneBoard(bno);
    }

    @Override
    public boolean modifyBoard(BoardVO bvo) {
        return false;
    }

    @Override
    public boolean deleteBoard(String bno) {
        return false;
    }

    // 게시글 총 개수
    public int countBoard(){

        return bdao.selectCountBoard();
    }
}
