<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use App\Contracts\SlideContract;
use App\Http\Controllers\BaseController;

class SlideController extends BaseController
{
    /**
     * @var SlideContract
     */
    protected $slideRepository;

    /**
     * CategoryController constructor.
     * @param SlideContract $slideRepository
     */
    public function __construct(SlideContract $slideRepository){
    	$this->slideRepository = $slideRepository;
    }

    /**
 		* @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
 	*/
	public function index(){
		$slides = $this->slideRepository->listSlides();
		$this->setPageTitle('Slides', 'List of all Slides');
		return view('admin.slides.index', compact('slides'));
	}

	/**
 		* @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	*/
	public function create(){
		$this->setPageTitle('Slides', 'Create Slides');
		return view('admin.slides.create');
	}

	/**
 * @param Request $request
 * @return \Illuminate\Http\RedirectResponse
 * @throws \Illuminate\Validation\ValidationException
 */
public function store(Request $request){
    $this->validate($request, [
        'title'      =>  'required|max:191',
        'sub_title'      =>  'required|max:191',
        'description'      =>  'required|max:191',
        'button_text'      =>  'required|max:191',
        'button_link'      =>  'required|max:191',
        'image'     =>  'mimes:jpg,jpeg,png|max:1000'
    ]);

    $params = $request->except('_token');

    $Slide = $this->slideRepository->createSlide($params);

    if (!$Slide) {
        return $this->responseRedirectBack('Error occurred while creating Slide.', 'error', true, true);
    }
    return $this->responseRedirect('admin.slides.index', 'Slide added successfully' ,'success',false, false);
}

/**
 * @param $id
 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
 */
public function edit($id)
{
    $Slide = $this->slideRepository->findSlideById($id);

    $this->setPageTitle('Slides', 'Edit Slide : '.$Slide->name);
    return view('admin.slides.edit', compact('Slide'));
}

/**
 * @param Request $request
 * @return \Illuminate\Http\RedirectResponse
 * @throws \Illuminate\Validation\ValidationException
 */
public function update(Request $request)
{
    $this->validate($request, [
        'name'      =>  'required|max:191',
        'image'     =>  'mimes:jpg,jpeg,png|max:1000'
    ]);

    $params = $request->except('_token');

    $Slide = $this->slideRepository->updateSlide($params);

    if (!$Slide) {
        return $this->responseRedirectBack('Error occurred while updating Slide.', 'error', true, true);
    }
    return $this->responseRedirectBack('Slide updated successfully' ,'success',false, false);
}

/**
 * @param $id
 * @return \Illuminate\Http\RedirectResponse
 */
public function delete($id)
{
    $Slide = $this->slideRepository->deleteSlide($id);

    if (!$Slide) {
        return $this->responseRedirectBack('Error occurred while deleting Slide.', 'error', true, true);
    }
    return $this->responseRedirect('admin.slides.index', 'Slide deleted successfully' ,'success',false, false);
}
}

