@extends('admin.app')
@section('title') {{ $pageTitle }} @endsection
@section('content')
    <div class="app-title">
        <div>
            <h1><i class="fa fa-tags"></i> {{ $pageTitle }}</h1>
        </div>
    </div>
    @include('admin.partials.flash')
    <div class="row">
        <div class="col-md-8 mx-auto">
            <div class="tile">
                <h3 class="tile-title">{{ $subTitle }}</h3>
                <form action="{{ route('admin.slides.store') }}" method="POST" role="form" enctype="multipart/form-data">
                    @csrf
                    <div class="tile-body">
                        <div class="form-group">
                            <label class="control-label" for="title">Title <span class="m-l-5 text-danger"> *</span></label>
                            <input class="form-control @error('title') is-invalid @enderror" type="text" name="title" id="title" value="{{ old('title') }}"/>
                            @error('name') {{ $message }} @enderror
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="sub_title">Sub Title <span class="m-l-5 text-danger"> *</span></label>
                            <input class="form-control @error('sub_title') is-invalid @enderror" type="text" name="sub_title" id="sub_title" value="{{ old('sub_title') }}"/>
                            @error('sub_title') {{ $message }} @enderror
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="description">Description</label>
                            <textarea class="form-control" rows="4" name="description" id="description">{{ old('description') }}</textarea>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="button_text">Button Text<span class="m-l-5 text-danger"> *</span></label>
                            <input class="form-control @error('button_text') is-invalid @enderror" type="text" name="button_text" id="button_text" value="{{ old('button_text') }}"/>
                            @error('button_text') {{ $message }} @enderror
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="button_link">Button Link<span class="m-l-5 text-danger"> *</span></label>
                            <input class="form-control @error('button_link') is-invalid @enderror" type="text" name="button_link" id="button_link" value="{{ old('button_link') }}"/>
                            @error('button_link') {{ $message }} @enderror
                        </div>
                        <div class="form-group">
                            <label class="control-label">Slide Image</label>
                            <input class="form-control @error('image') is-invalid @enderror" type="file" id="image" name="image"/>
                            @error('image') {{ $message }} @enderror
                        </div>
                    </div>
                    <div class="tile-footer">
                        <button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>Save Slide</button>
                        &nbsp;&nbsp;&nbsp;
                        <a class="btn btn-secondary" href="{{ route('admin.slides.index') }}"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
@push('scripts')

@endpush
