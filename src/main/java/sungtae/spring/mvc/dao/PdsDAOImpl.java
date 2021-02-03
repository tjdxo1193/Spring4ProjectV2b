package sungtae.spring.mvc.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import sungtae.spring.mvc.vo.PdsVO;

import java.util.List;

@Repository("pdao")
public class PdsDAOImpl implements PdsDAO{

    @Autowired private SqlSession sqlSession;

    @Override
    public int insertPds(PdsVO pvo) {
        return sqlSession.insert("pds.insertPds", pvo);
    }

    @Override
    public List<PdsVO> selectPds(int snum) {
        return sqlSession.selectList("pds.selectList", snum);
    }

    @Override
    public int selectCountPds() {
        return sqlSession.selectOne("pds.countPds");
    }
}
