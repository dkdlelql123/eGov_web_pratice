/*
 * Copyright 2011 MOPAS(Ministry of Public Administration and Security).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.board.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.board.service.BoardVO;

@Mapper("boardMapper")
public interface BoardMapper {

	/**
	 * 글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 BoardVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	void insertBoard(BoardVO vo) throws Exception;

	/**
	 * 글을 수정한다.
	 * @param vo - 수정할 정보가 담긴 BoardVO
	 * @return void형
	 * @exception Exception
	 */
	void updateBoard(BoardVO vo) throws Exception;
	
	/**
	 * 글 조회수 증가
	 * @param vo - 조회수 증가할 정보가 담긴 BoardVO
	 * @return void형
	 * @exception Exception
	 */
	void updateBoardCount(BoardVO vo) throws Exception;

	/**
	 * 글을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 BoardVO
	 * @return void형
	 * @exception Exception
	 */
	void deleteBoard(BoardVO vo) throws Exception;

	/**
	 * 글을 조회한다.
	 * @param vo - 조회할 정보가 담긴 BoardVO
	 * @return 조회한 글
	 * @exception Exception
	 */
	BoardVO selectBoard(BoardVO vo) throws Exception;

	/**
	 * 글 목록을 조회한다.
	 * @param BoardVO - 조회할 정보가 담긴 VO
	 * @return 글 목록
	 * @exception Exception
	 */
	List<?> selectBoardList(BoardVO vo) throws Exception;

	/**
	 * 글 총 갯수를 조회한다.
	 * @param BoardVO - 조회할 정보가 담긴 VO
	 * @return 글 총 갯수
	 * @exception
	 */
	int selectBoardListTotCnt(BoardVO vo);
	
	/**
	 * 로그인 체크
	 * @param BoardVO - 아이디, 패스워드 정보 담김
	 * @return 이름
	 * @exception
	 */
	String selectLoginCheck(BoardVO vo);
	
	/**
	 * 댓글을 등록한다.
	 * @param vo - 등록할 정보가 담긴 BoardVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	void insertReply(BoardVO vo) throws Exception;
	
	/**
	 * 댓글 목록을 조회한다.
	 * @param relId - 조회할 정보가 담긴 게시판 relId
	 * @return 댓글 목록
	 * @exception Exception
	 */
	List<BoardVO> selectReplyList(int relId);

}
