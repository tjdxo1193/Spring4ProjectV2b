package sungtae.spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sungtae.spring.mvc.dao.BoardDAO;
import sungtae.spring.mvc.vo.BoardVO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("bsrv")
public class BoardServiceImpl implements BoardService {

    @Autowired private BoardDAO bdao;

    @Override   // 새글쓰기
    public boolean newBoard(BoardVO bvo) {
        boolean isOk = false;

        // 줄바꿈기호를 <br>로 변환작업 필요할 수도 있음
        // 지금 예제에서는 뷰단에서 변환작업을 수행하도록 작성함
        int cnt = bdao.insertBoard(bvo);
        if (cnt > 0) isOk = true;

        return isOk;
    }

    @Override   // 리스트보기
    public List<BoardVO> readBoard(String cp) {
        int snum = (Integer.parseInt(cp) - 1) * 10;

        return bdao.selectBoard(snum);
    }

    @Override
    public List<BoardVO> readBoard(String cp, String findtype, String findkey) {
        Map<String, Object> param = new HashMap<>();

        int snum = (Integer.parseInt(cp) - 1) * 10;
        param.put("snum", snum);
        param.put("findType", findtype);
        param.put("findKey", findkey);

        return bdao.findSelectList(param);
    }

    @Override   // 본문보기
    public BoardVO readOneBoard(String bno) {
        return bdao.selectOneBoard(bno);
    }

    @Override   // 수정하기
    public boolean modifyBoard(BoardVO bvo) {
        boolean isOk = false;
        int cnt = bdao.updateBoard(bvo);
        if (cnt > 0) isOk = true;
        return isOk;
    }

    @Override   // 삭제하기
    public boolean removeBoard(String bno) {
        boolean isOk = false;
        int cnt = bdao.deleteBoard(bno);
        if (cnt > 0) isOk = true;
        return isOk;
    }

    // 게시글 총 갯수
    public int countBoard() {
        return bdao.selectCountBoard();
    }

    @Override
    public int countBoard(String findtype, String findkey) {
        Map<String, String> param = new HashMap<>();

        param.put("findType", findtype);
        param.put("findKey", findkey);
        return bdao.selectCountBoard(param);
    }

    @Override  // 조회수 증가
    public boolean viewCountBoard(String bno) {
        boolean isOk = false;
        int cnt = bdao.updateViewCount(bno);
        if (cnt > 0) isOk = true;
        return isOk;
    }
}