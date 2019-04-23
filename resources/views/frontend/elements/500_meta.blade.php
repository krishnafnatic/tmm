<head>
  <!-- Google Tag Manager -->
  <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','GTM-55GSLDJ');</script>
  <meta name="robots" content="noindex, nofollow">
  <!-- End Google Tag Manager -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- CSRF Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}" />
  <!-- viewport -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Title -->
  @if( !empty( $meta['meta_title'] ) )
    <title>{{ $meta['meta_title'] }} | {{ config('app.name') }} | {{ config('app.message') }}</title>
  @else
    <title>500 - Internal Server Error | {{ config('app.name') }} | {{ config('app.message') }}</title>
  @endif
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="{{ asset( 'frontend/css/style.css' ) }}" />
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto" /> 
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous" />

  <!-- @if( !empty( $meta['meta_title'] ) )
    <meta name="author" content="{{ $meta['meta_title'] }}">
  @endif -->

  @if( !empty( $meta['meta_description'] ) )
    <meta name="description" content="{{ $meta['meta_description'] }}">
  @endif

  @if( !empty( $meta['meta_keyword'] ) )
    <meta name="keywords" content="{{ $meta['meta_keyword'] }}">
  @endif
  <!-- Google WebMaster-->
  <meta name="google-site-verification" content="AHrDaEmRXAy1RWs6NtDpq8z1llYurCKN4w_h1RcB2f4" />
</head>
