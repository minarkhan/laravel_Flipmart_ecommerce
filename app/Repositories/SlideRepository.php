<?php
namespace App\Repositories;

use App\Models\Slide;
use App\Traits\UploadAble;
use Illuminate\Http\UploadedFile;
use App\Contracts\SlideContract;
use Illuminate\Database\QueryException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Doctrine\Instantiator\Exception\InvalidArgumentException;

/**
 * Class CategoryRepository
 *
 * @package \App\Repositories
 */
class SlideRepository extends BaseRepository implements SlideContract
{
    use UploadAble;

    /**
     * CategoryRepository constructor.
     * @param Slide $model
     */
    public function __construct(Slide $model)
    {
        parent::__construct($model);
        $this->model = $model;
    }

    /**
     * @param string $order
     * @param string $sort
     * @param array $columns
     * @return mixed
     */
    public function listSlides(string $order = 'id', string $sort = 'desc', array $columns = ['*'])
    {
        return $this->all($columns, $order, $sort);
    }

    /**
     * @param int $id
     * @return mixed
     * @throws ModelNotFoundException
     */
    public function findSlideById(int $id)
    {
        try {
            return $this->findOneOrFail($id);

        } catch (ModelNotFoundException $e) {

            throw new ModelNotFoundException($e);
        }

    }

    /**
     * @param array $params
     * @return Slide|mixed
     */
    public function createSlide(array $params)
    {
        try {
            $collection = collect($params);

            $logo = null;

            if ($collection->has('logo') && ($params['logo'] instanceof  UploadedFile)) {
                $logo = $this->uploadOne($params['logo'], 'Slides');
            }

            $merge = $collection->merge(compact('logo'));

            $Slide = new Slide($merge->all());

            $Slide->save();

            return $Slide;

        } catch (QueryException $exception) {
            throw new InvalidArgumentException($exception->getMessage());
        }
    }

    /**
     * @param array $params
     * @return mixed
     */
    public function updateSlide(array $params)
    {
        $Slide = $this->findSlideById($params['id']);

        $collection = collect($params)->except('_token');

        if ($collection->has('logo') && ($params['logo'] instanceof  UploadedFile)) {

            if ($Slide->logo != null) {
                $this->deleteOne($Slide->logo);
            }

            $logo = $this->uploadOne($params['logo'], 'Slides');
        }

        $merge = $collection->merge(compact('logo'));

        $Slide->update($merge->all());

        return $Slide;
    }

    /**
     * @param $id
     * @return bool|mixed
     */
    public function deleteSlide($id)
    {
        $Slide = $this->findSlideById($id);

        if ($Slide->logo != null) {
            $this->deleteOne($Slide->logo);
        }

        $Slide->delete();

        return $Slide;
    }
}