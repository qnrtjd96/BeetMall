package com.beetmall.sshj.custom.dao;

import java.util.List;

import com.beetmall.sshj.custom.vo.ClaimVO;
import com.beetmall.sshj.custom.vo.MyBuyListVO;
import com.beetmall.sshj.custom.vo.PointPageVO;
import com.beetmall.sshj.custom.vo.ReviewVO;
import com.beetmall.sshj.custom.vo.UserQBoardVO;

public interface MyBuyListDAO {
	public List<MyBuyListVO> selectBuyList(PointPageVO vo);
	public int orderCommit(long ordernum);
	public int orderCancel(long ordernum);
	public int orderCancelOk(long ordernum);
	public int reviewCheck(long ordernum);
	public MyBuyListVO selectReviewProduct(int productnum);
	public int reviewWrite(ReviewVO vo);
	public ReviewVO reviewSelect(long ordernum);
	public int reviewgoodCount(int reviewnum);
	public int reviewcheck(int reviewnum, String userid);
	public int reviewGoodCancel(int reviewnum, String userid);
	public int reviewGood(int reviewnum, String userid);
	public int claimInsert(ClaimVO vo);
	public int claimUpdate(long ordernum, String status);
	public ClaimVO returnSelect(long ordernum);
	public int qboardInsert(UserQBoardVO vo);
	public int returnFinish(long ordernum);
	public List<MyBuyListVO> monthSelectBuyList(String userid, int month);
	public int returnPageRecord(String userid);
	public int returnPageRecordMonth(String userid, int month);
	
}
