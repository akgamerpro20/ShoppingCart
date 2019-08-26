<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="{{route('homepage')}}"><i class="fas fa-home"></i> Shop</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <!-- <ul class="nav navbar-nav">
        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul> -->
      <!-- <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form> -->
      <ul class="nav navbar-nav navbar-right">
        <!-- <li><a href="#"><i class="fas fa-dumpster-fire"></i> Category</a></li>
        <li><a href="#"><i class="fas fa-code-branch"></i>&nbsp;&nbsp;Brand</a></li> -->
        <li><a href="{{route('product_shoppingCart')}}"><i class="fas fa-cart-arrow-down"></i>&nbsp;&nbsp;

          Cart
          <span class="badge cart-count" data-cart-count="{{ Session::has('cart') ? Session::get('cart')->totalQty : 0 }}">{{ Session::has('cart') ? Session::get('cart')->totalQty : 0 }}</span>
            
        </a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fab fa-asymmetrik"></i>&nbsp;&nbsp;Categories <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="{{ route('homepage') }}"><i class="fab fa-atlassian"></i>&nbsp;&nbsp;All Products</a></li>
              @foreach($categories as $category)
                <li><a href="{{route('category_filter',$category->id)}}"><i class="fab fa-atlassian"></i>&nbsp;&nbsp;{{$category->name}}</a></li>
              @endforeach
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fas fa-users"></i> <span class="caret"></span></a>
          <ul class="dropdown-menu">
            @if(auth()->check())
              <li><a href="{{ route('user_profile') }}"><i class="fas fa-user"></i>&nbsp;&nbsp;User Profile</a></li>
              <li><a href="{{ route('user.logout') }}"><i class="fas fa-sign-out-alt"></i>&nbsp;&nbsp;Logout</a></li>
            @else
              <li><a href="{{ route('login') }}"><i class="fas fa-sign-in-alt"></i>&nbsp;&nbsp;Login</a></li>
              <li><a href="{{ route('register') }}"><i class="fas fa-registered"></i>&nbsp;&nbsp;Register</a></li>
            @endif
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>