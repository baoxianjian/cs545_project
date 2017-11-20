package edu.mum.project.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.mum.project.service.PostService;
import edu.mum.project.domain.Post;
import edu.mum.project.domain.User;
import edu.mum.project.exception.ImageCannotUploadException;


@Controller
public class PostController {
	
	@Autowired
	private PostService postService;
	
	
	@RequestMapping(value="/post/list", method=RequestMethod.GET)
	public String getList(Model model){
		
		List<Post> posts = postService.getAll();

		model.addAttribute("posts",posts);
		return "post-list";
	}
	
	@RequestMapping(value="/post/add", method=RequestMethod.GET)
	public String form(@ModelAttribute("post") Post post, Model model){
		Map<Integer, String> types = postService.getTypeList();
		
		model.addAttribute("types",types);
		return "post-form";
	}
	

	
	@RequestMapping(value = "/post/add", method=RequestMethod.POST)
	public String add(@Valid @ModelAttribute("post") Post post, BindingResult bindingResult,
			Model model, HttpServletRequest request) throws ImageCannotUploadException {

		
		if(bindingResult.hasErrors()) {
			return "EmployeeForm";
		}

		String[] suppressedFields = bindingResult.getSuppressedFields();
		if (suppressedFields.length > 0) {
			throw new RuntimeException("Attempt to bind fields that haven't been allowed in initBinder(): "
					+ StringUtils.addStringToArray(suppressedFields, ", "));
		}
		
		MultipartFile image = post.getImage();
		
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		if (image == null || image.isEmpty() || image.getSize()==0) {
			
			throw new ImageCannotUploadException("Image can not be uploaded. 1");
		}
		try {
			System.out.println(image.getName());
			System.out.println(request.getContextPath());
			
			String path = "resources\\uploads\\" + post.getId()+".png";
			String webPath = request.getContextPath()+"/resource/uploads/" + post.getId()+".png";;
			String fullPath=rootDirectory + path;
			image.transferTo(new File(fullPath));
			
			post.setImagePath(webPath);

			
		} catch (Exception e) {
			throw new ImageCannotUploadException("Image can not be uploaded. 2");//new RuntimeException("Product Image saving failed", e);
		}


		postService.save(post);
		
		// save product here
		model.addAttribute("post", post);

		return "redirect:list";
	}

	
	
	@RequestMapping(value="/post/detail", method=RequestMethod.GET)
	public String detail(@RequestParam("id") Long id, Model model){
		Post post = postService.getById(id);
		model.addAttribute("post",post);
		return "post-detail";
	}
	
	
	
	
	
	
	
	
	
	
	
}
