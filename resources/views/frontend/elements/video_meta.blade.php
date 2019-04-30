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
    <title>{{ config('app.name') }} | {{ config('app.message') }}</title>
  @endif
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" type="text/css" href="{{ asset( 'frontend/css/style.css' ) }}" />
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
  <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" /> 
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous" />

  @if( !empty( $meta['meta_description'] ) )
    <meta name="description" content="{{ $meta['meta_description'] }}">
  @endif

  @if( !empty( $meta['meta_keyword'] ) )
    <meta name="keywords" content="{{ $meta['meta_keyword'] }}">
  @endif
  <!-- Open Graph Sharing Metadata -->
  <meta property="og:site_name" content="{{ config('app.name') }}">
  <meta property="og:title" content="{{ $video_detail['name'] }}">
  <meta property="og:description" content="{{ $video_detail['description'] }}">
  <meta property="og:url" content="<?php echo URL::current(); ?>">
  @if(!empty($video_detail['images']['poster']['src']))
  <meta property="og:image" content="{{ $video_detail['images']['poster']['src'] }}">
  @endif
  <meta property="og:type" content="video">
  <meta property="og:video" content="https://players.brightcove.net/{{ $video_detail['account_id'] }}/oNgLTdNCH_default/index.html?videoId={{ $video_detail['video_id'] }}">
  <meta property="og:video:width" content="640">
  <meta property="og:video:height" content="360">
  <!-- Twitter: card/meta-tags -->
  <meta name="twitter:card" content="player"/>
  <meta name="twitter:site" content="@username" />
  <meta name="twitter:title" content="{{ $video_detail['name'] }}"/>
  <meta name="twitter:description" content="{{ $video_detail['description'] }}"/>
  @if(!empty($video_detail['images']['thumbnail']['src']))
  <meta name="twitter:image" content="{{ $video_detail['images']['thumbnail']['src'] }}"/>
  @endif
  <meta name="twitter:player" content="<?php echo URL::current(); ?>"/>
  <meta name="twitter:player:width" content="640"/>
  <meta name="twitter:player:height" content="360"/>
  <meta name="twitter:stream" content="<?php echo URL::current(); ?>"/>
  <meta name="twitter:player:stream:content_type" content="video/mp4" />

  <!-- Google WebMaster-->
  <meta name="google-site-verification" content="AHrDaEmRXAy1RWs6NtDpq8z1llYurCKN4w_h1RcB2f4" />
</head>
