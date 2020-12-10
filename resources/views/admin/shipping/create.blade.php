@extends('admin.app')
@section('title') {{ $pageTitle }} @endsection
@section('content')
    <div class="app-title">
        <div>
            <h1><i class="fa fa-briefcase"></i> {{ $pageTitle }}</h1>
        </div>
    </div>
    @include('admin.partials.flash')
    <div class="row">
        <div class="col-md-8 mx-auto">
            <div class="tile">
                <h3 class="tile-title">{{ $subTitle }}</h3>
                <form action="{{ route('admin.shippings.store') }}" method="POST" role="form" enctype="multipart/form-data">
                    @csrf
                        
                    <div class="tile-body">
                        <div class="form-group">
                            <label class="control-label" for="zone_name">zone_name <span class="m-l-5 text-danger"> *</span></label>
                            <input class="form-control @error('zone_name') is-invalid @enderror" type="text" name="zone_name" id="zone_name" value="{{ old('zone_name') }}"/>
                            @error('zone_name') {{ $message }} @enderror
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="zone_name">zone_regions <span class="m-l-5 text-danger"> *</span></label>
                            <input class="form-control @error('zone_regions') is-invalid @enderror" type="text" name="zone_regions" id="zone_regions" value="{{ old('zone_regions') }}"/>
                            @error('zone_regions') {{ $message }} @enderror
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="method">Shipping Method <span class="m-l-5 text-danger"> *</span></label>
                             <select class="form-control"  name="status" id="status">
                                <option value="Flat Rate">Flat Rate</option>
                                <option value="Free Shipping">Free Shipping</option>
                                <option value="Local Pickup">Local Pickup</option>
                            </select>
                            @error('method') {{ $message }} @enderror
                            
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="rate">Rate <span class="m-l-5 text-danger"> *</span></label>
                            <input class="form-control @error('rate') is-invalid @enderror" type="text" name="rate" id="rate" value="{{ old('rate') }}" placeholder="Shipping rate" />
                            @error('rate') {{ $message }} @enderror
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="status">status <span class="m-l-5 text-danger"> *</span></label>
                            <select class="form-control"  name="status" id="status">
                                <option value="active">Active</option>
                                <option value="inactive">Inactive</option>
                            </select>
                            @error('status') {{ $message }} @enderror
                        </div>
                    </div>
                    <div class="tile-footer">
                        <button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>Save Shipping</button>
                        &nbsp;&nbsp;&nbsp;
                        <a class="btn btn-secondary" href="{{ route('admin.shippings.index') }}"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection