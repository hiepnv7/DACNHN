package com.eoptech.shopdoda.cotroller.admin.blog;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eoptech.shopdoda.entities.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eoptech.shopdoda.dto.AjaxResponse;
import com.eoptech.shopdoda.dto.ApprovedObj;
import com.eoptech.shopdoda.dto.search.ReviewOrCommentSearch;
import com.eoptech.shopdoda.entities.blog.BlogComment;
import com.eoptech.shopdoda.repositories.blog.BlogCommentRepo;
import com.eoptech.shopdoda.services.blog.BlogCommentService;

@Controller
public class CommentAdminController {
	@Autowired
	private BlogCommentRepo commentRepo;
	@Autowired
	private BlogCommentService commentService;

	@RequestMapping(value = { "/admin/comments/{id}" }, method = RequestMethod.GET)
	public String index(final ModelMap model, final HttpServletRequest request, final HttpServletResponse response,
			@PathVariable("id") int blogId) throws Exception {
		ReviewOrCommentSearch commentSearch = new ReviewOrCommentSearch();
		commentSearch.setIdProductOrBlog(blogId);
		commentSearch.buildPaging(request);

		List<BlogComment> comments = commentService.search(commentSearch);
		model.addAttribute("comments", comments);
		model.addAttribute("commentSearch", commentSearch);

		return "back-end/user/comment";
	}

	// C3: Dùng Ajax
	@RequestMapping(value = { "/admin/comments/approve" }, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> approveComment(final ModelMap model, final HttpServletRequest request,
			final HttpServletResponse response, @RequestBody ApprovedObj approvedObj) {
		BlogComment comment = commentRepo.findById(approvedObj.getId()).get();
		comment.setStatus(true);
		commentRepo.save(comment);

		return ResponseEntity.ok(new AjaxResponse(200, "Duyệt comment thành công!"));
	}
	// Unapprove
	@RequestMapping(value = { "/admin/comments/un-approve" }, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> UnapproveComment(final ModelMap model, final HttpServletRequest request,
																										 final HttpServletResponse response, @RequestBody ApprovedObj approvedObj) {
		BlogComment comment = commentRepo.findById(approvedObj.getId()).get();
		comment.setStatus(Boolean.FALSE);
		commentRepo.save(comment);

		return ResponseEntity.ok(new AjaxResponse(200, "Hủy duyệt comment thành công!"));
	}
	// Delete comments
	@RequestMapping(value = { "/admin/comments/delete/{id}" }, method = RequestMethod.POST)
	public ResponseEntity<AjaxResponse> deleteComment(final ModelMap model, final HttpServletRequest request,
															final HttpServletResponse response, @PathVariable("id") int commentId) throws Exception {
		BlogComment commentDeleted = commentRepo.findById(commentId).get();
		commentDeleted.setIsDeleted(Boolean.TRUE);
		commentRepo.save(commentDeleted);

		return ResponseEntity.ok(new AjaxResponse(200, "Xóa comment thành công!"));
	}
}
