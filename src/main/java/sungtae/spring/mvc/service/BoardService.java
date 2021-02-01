package sungtae.spring.mvc.service;

import sungtae.spring.mvc.vo.BoardVO;

import java.util.List;

public interface BoardService {
    boolean newBoard(BoardVO bvo);
    List<BoardVO> readBoard(String cp);
    List<BoardVO> readBoard(String cp, String findtype, String findkey);
    BoardVO readOneBoard(String bno);
    boolean modifyBoard(BoardVO bvo);
    boolean removeBoard(String bno);
    int countBoard();
    int countBoard(String findtype, String findkey);
    boolean viewCountBoard(String bno);

}