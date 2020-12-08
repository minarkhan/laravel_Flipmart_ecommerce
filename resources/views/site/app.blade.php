<!DOCTYPE html>
<html lang="en">

<head>
<!-- Meta -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">
<meta name="keywords" content="MediaCenter, Template, eCommerce">
<meta name="robots" content="all">
<title>@yield('title') - {{ config('app.name') }}</title>
@include('site.partials.styles')

</head>
<body class="cnt-home">
@include('site.partials.header')

@yield('content')


@include('site.partials.footer')

@include('site.partials.scripts')
</body>

</html>