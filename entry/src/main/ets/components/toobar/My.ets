import { FunctionalButton } from "@hms.core.atomicserviceComponent.atomicserviceUi";

@ComponentV2
export struct My {
  @Consumer('NavPathStack') navPageInfos: NavPathStack = new NavPathStack();
  build() {
    Column() {
      TopNavigationBar()
      Scroll() {
        Column() {
          // 用户信息
          UserInfoComponent()
            .onClick(() => {
              this.navPageInfos.pushPath({ name: 'Login' })
            })
          // 抽奖入口
          LotteryComponent()
          // 会员入口
          MemberCardComponent()
          // 订单状态
          OrderStatusComponent()
          // 服务菜单
          ServerComponent()
          // banner广告
          BannerComponent()
          // 精选商品
          GoodsComponent()
        }
      }
      .layoutWeight(1)
      .height('100%')
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Off)
      .align(Alignment.TopStart)
      .padding({ bottom: 15 })
    }
    .height('100%')
    .backgroundColor($r('app.color.background_secondary'))
  }
}
@ComponentV2
struct  TopNavigationBar{
  @Styles iconStyle(){
    .width(20)
    .height(20)
    .margin({ left: 10 })
  }
  build() {
    Row(){
      Image($r('app.media.qrcode'))
        .iconStyle()
        .fillColor($r('app.color.font_secondary'))
      Image($r('app.media.setting'))
        .iconStyle()
        .fillColor($r('app.color.font_secondary'))
      Stack(){
        Image($r('app.media.message'))
          .iconStyle()
          .fillColor($r('app.color.font_secondary'))
        Text('33')
          .position({ x: 20, y: 6 })
          .backgroundColor($r('app.color.background_message'))
          .borderRadius(10)
          .width(18)
          .textAlign(TextAlign.Center)
          .height(18)
          .fontSize(10)
          .fontColor(Color.White)
      }
      .height('100%')
    }
    .width('100%')
    .height(54)
    .justifyContent(FlexAlign.End)
    .padding({ left: 15, right: 15 })
  }
}

@ComponentV2
struct UserInfoComponent{
  build() {
    Column(){
      Row(){
        Image($r('app.media.avatar'))
          .width(60)
          .height(60)
          .fillColor($r('app.color.font_fourth'))
        Column(){
          Text('X')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.font_first'))
          Row(){
            Text(`小米ID 000001`)
              .tagStyle()

            Text(`勋章5枚 >`)
              .tagStyle()
          }
          .margin({ top: 8 })
        }
        .margin({ left: 10 })
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .padding({ left: 15, right: 15 })

      GridRow({columns: 5 }){
        GridCol(){
          Column(){
            Text(`125`)
              .menuValueStyle()
            Text('米金')
              .menuTextStyle($r('app.color.font_tertiary'))
          }
        }
        GridCol(){
          Column(){
            Text(`0`)
              .menuValueStyle()
            Text('优惠券')
              .menuTextStyle($r('app.color.font_tertiary'))
          }
        }
        GridCol(){
          Column(){
            Row(){
              Text(`0`)
                .menuValueStyle()
              Text('元')
                .fontSize(12)
            }
            .alignItems(VerticalAlign.Bottom)
            Text('红包')
              .menuTextStyle($r('app.color.font_tertiary'))
          }
        }
        GridCol(){
          Column(){
            Row(){
              Text(`20`)
                .menuValueStyle()
              Text('万元')
                .fontSize(12)
            }
            .alignItems(VerticalAlign.Bottom)
            Text('最高可用')
              .menuTextStyle($r('app.color.font_tertiary'))
          }
        }
        GridCol(){
          Column(){
            Image($r('app.media.my_bag'))
              .height(20)
            Text('钱包')
              .menuTextStyle($r('app.color.font_tertiary'))
          }
        }
      }
      .margin({ top: 12 })
    }
  }
}

@Extend(Text) function tagStyle(){
  .padding({ top: 2, left: 5, right: 5, bottom: 2 })
  .borderRadius(10)
  .backgroundColor($r('app.color.background_tertiary'))
  .margin({ right: 8 })
  .fontSize(12)
  .fontColor($r('app.color.font_secondary'))
}
@Extend(Text) function menuTextStyle(color: string | Resource){
  .fontSize(14)
  .fontColor(color)
  .margin({ top: 12 })
}
@Extend(Text) function menuValueStyle(){
  .fontSize(18)
  .fontColor($r('app.color.font_first'))
  .fontWeight(600)
  .height(20)
}

@Builder function LotteryComponent(){
  Column(){
    Row(){
      Row(){
        Image($r('app.media.my_mijing'))
          .width(14)
          .height(14)
        Text('米金赢SU7合金车模')
          .fontSize(14)
          .fontColor($r('app.color.font_secondary'))
      }
      Row(){
        Text('去抽奖')
          .fontSize(14)
          .fontColor($r('app.color.font_secondary'))
          .fontWeight(500)
        Image($r('app.media.right'))
          .width(14)
          .fillColor($r('app.color.font_secondary'))
      }
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor('#f5ede0')
    .padding({ left: 15, right: 15, top: 10, bottom: 10 })
    .borderRadius(10)
  }
  .width('100%')
  .padding({ left: 15, right: 15 })
  .margin({ top: 10 })
}

@Extend(Text) function quanYiTextStyle(){
  .fontSize(10)
  .margin({ right: 10 })
  .fontColor($r('app.color.font_tertiary'))
}

/**
 * 会员组件
 */
@Builder function MemberCardComponent(){
  Column(){
    Row(){
      Column(){
        Text('小米FRIEND会员中心')
          .fontSize(14)
          .fontColor($r('app.color.font_first'))
          .fontWeight(500)
        Row(){
          Text(`30天保价`).quanYiTextStyle()
          Text(`F码优先购`).quanYiTextStyle()
          Text(`尊享优惠券`).quanYiTextStyle()
        }
        .margin({ top: 6 })
      }
      .alignItems(HorizontalAlign.Start)
      Row(){
        Text('查看权益')
          .fontSize(14)
          .fontWeight(500)
          .fontColor($r('app.color.font_secondary'))
        Image($r('app.media.right'))
          .width(14)
          .fillColor($r('app.color.font_secondary'))
      }
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor('#f5ede0')
    .padding(15)
    .borderRadius(10)
  }
  .width('100%')
  .padding({ left: 15, right: 15 })
  .margin({ top: 10 })
}


@Extend(Text) function orderStatusTextStyle(){
  .fontSize(14)
  .fontColor($r('app.color.font_secondary'))
  .margin({ right: 4 })
}

@Extend(Image) function menuImgStyle(size?: number){
  .width(size || 24)
}

/**
 * 订单状态组件
 */
@ComponentV2
struct OrderStatusComponent{
  build() {
    Column(){
      Column(){
        Stack(){
          GridRow({ columns: 3 }){
            GridCol(){
              Row(){
                Text('收藏')
                  .orderStatusTextStyle()
                Text(`0`)
                  .fontSize(14)
              }
              .height(40)
            }
            GridCol(){
              Row(){
                Text('足迹')
                  .orderStatusTextStyle()
                Text(`0`)
                  .fontSize(14)
              }
              .height(40)
            }
            GridCol(){
              Row(){
                Text('关注')
                  .orderStatusTextStyle()
                Text(`0`)
                  .fontSize(14)
              }
              .height(40)
            }
          }
          Row(){
            Column()
              .height(15)
              .width(1)
              .backgroundColor($r('app.color.background_fourth'))
              .borderRadius(2)
            Column()
              .height(15)
              .width(1)
              .backgroundColor($r('app.color.background_fourth'))
              .borderRadius(2)
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceEvenly)
        }
        .border({ width: { bottom: 1 }, color: $r('app.color.background_fourth') })
        GridRow({ columns: 5 }){
          GridCol(){
            Column(){
              Image($r('app.media.my_qianbao'))
                .menuImgStyle()
              Text('待付款')
                .menuTextStyle($r('app.color.font_first'))
            }
          }
          GridCol() {
            Column() {
              Image($r('app.media.my_wuliuxinxi'))
                .menuImgStyle()
              Text('待收货')
                .menuTextStyle($r('app.color.font_first'))
            }
          }
          GridCol(){
            Column(){
              Image($r('app.media.my_pingjia'))
                .menuImgStyle()
              Text('待评价')
                .menuTextStyle($r('app.color.font_first'))
            }
          }
          GridCol(){
            Column(){
              Image($r('app.media.my_wuyoushouhou'))
                .menuImgStyle()
              Text('退换/售后')
                .menuTextStyle($r('app.color.font_first'))
            }
          }
          GridCol(){
            Column(){
              Image($r('app.media.my_dingdan'))
                .menuImgStyle()
              Text('全部订单')
                .menuTextStyle($r('app.color.font_first'))
            }
          }
        }
        .margin({ top: 20, bottom: 15 })
      }
      .width('100%')
      .backgroundColor($r('app.color.background_primary'))
      .borderRadius(10)
      .padding(5)
    }
    .padding({ left: 15, right: 15 })
    .margin({ top: 15 })
  }
}

/**
 * 服务菜单组件
 */
@ComponentV2
struct ServerComponent{
  @Styles gridColStyle(){
    .margin({ top: 20 })
  }
  build() {
    Column(){
      Column(){
        Row(){
          Text('服务')
            .fontSize(16)
            .fontWeight(700)
          Row(){
            Text('查看更多')
              .fontSize(14)
              .fontColor($r('app.color.font_tertiary'))
            Image($r('app.media.line_right'))
              .width(16)
              .fillColor($r('app.color.font_tertiary'))
          }
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        GridRow({ columns: 4 }){
          GridCol(){
            Column(){
              Image($r('app.media.home_active'))
                .menuImgStyle(28)
              Text('一键安装')
                .menuTextStyle($r('app.color.font_first'))
            }
          }
          .gridColStyle()
          GridCol(){
            Column(){
              Image($r('app.media.home_active'))
                .menuImgStyle(28)
              Text('一键退换')
                .menuTextStyle($r('app.color.font_first'))
            }
          }
          .gridColStyle()
          GridCol(){
            Column(){
              Image($r('app.media.home_active'))
                .menuImgStyle(28)
              Text('一键维修')
                .menuTextStyle($r('app.color.font_first'))
            }
          }
          .gridColStyle()
          GridCol(){
            Column(){
              Image($r('app.media.home_active'))
                .menuImgStyle(28)
              Text('服务进度')
                .menuTextStyle($r('app.color.font_first'))
            }
          }
          .gridColStyle()
          GridCol(){
            Column(){
              Image($r('app.media.home_active'))
                .menuImgStyle(28)
              Text('小米之家')
                .menuTextStyle($r('app.color.font_first'))
            }
          }
          .gridColStyle()
          GridCol(){
            Column(){
              Image($r('app.media.home_active'))
                .menuImgStyle(28)
              Text('客服中心')
                .menuTextStyle($r('app.color.font_first'))
            }
          }
          .gridColStyle()
          GridCol(){
            Column(){
              Image($r('app.media.home_active'))
                .menuImgStyle(28)
              Text('以旧换新')
                .menuTextStyle($r('app.color.font_first'))
            }
          }
          .gridColStyle()
          GridCol(){
            Column(){
              Image($r('app.media.home_active'))
                .menuImgStyle(28)
              Text('保障权益')
                .menuTextStyle($r('app.color.font_first'))
            }
          }
          .gridColStyle()
        }
      }
      .width('100%')
      .backgroundColor($r('app.color.background_primary'))
      .padding(15)
      .borderRadius(10)
    }
    .width('100%')
    .padding({ left: 15, right: 15 })
    .margin({ top: 15 })
  }
}

/**
 * banner广告组件
 */
@ComponentV2
struct BannerComponent{
  @Styles bannerStyle(){
    .width('100%')
    .borderRadius(10)
  }
  build() {
    Column(){
      Swiper(){
        Image($r('app.media.banner1'))
          .bannerStyle()
        Image($r('app.media.banner2'))
          .bannerStyle()
        Image($r('app.media.banner3'))
          .bannerStyle()
        Image($r('app.media.banner4'))
          .bannerStyle()
        Image($r('app.media.banner5'))
          .bannerStyle()
        Image($r('app.media.banner6'))
          .bannerStyle()
      }
      .autoPlay(true)
      .width('100%')
      .borderRadius(10)
    }
    .width('100%')
    .padding({ left: 15, right: 15 })
    .margin({ top: 15 })
  }
}

/**
 * 精选商品组件
 */
@ComponentV2
struct GoodsComponent{

  @Builder
  GoodsItem(){
    Column(){
      Image($r('app.media.goods1'))
        .width('100%')
        .borderRadius({ topLeft: 10, topRight: 10 })
      Column(){
        Text('Redmi K70')
          .font({ size: 14, weight: 500 })
        Text('第二代骁龙8 旗舰芯片')
          .font({ size: 12 })
          .fontColor($r('app.color.font_tertiary'))
          .margin({ top: 10 })
        Row(){
          Text(`￥2299`)
            .font({ size: 16, weight: 500 })
            .fontColor($r('app.color.font_primary'))
          Text('起')
            .fontSize(12)
            .fontColor($r('app.color.font_tertiary'))
        }
        .alignItems(VerticalAlign.Bottom)
        .margin({ top: 6 })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
      .padding(10)
    }
    .width('49%')
    .backgroundColor($r('app.color.background_primary'))
    .borderRadius(10)
    .margin({ top: 10 })
  }

  build() {
    Column(){
      Text('精选')
        .font({ size: 14, weight: 500 })
        .margin({ left: 15 })
      WaterFlow(){
        FlowItem(){
          Column(){
            Image($r('app.media.goods1'))
              .width('100%')
              .borderRadius({ topLeft: 10, topRight: 10 })
            Column(){
              Text('Redmi K70')
                .font({ size: 14, weight: 500 })
              Text('第二代骁龙8 旗舰芯片')
                .font({ size: 12 })
                .fontColor($r('app.color.font_tertiary'))
                .margin({ top: 10 })
              Row(){
                Text(`￥2299`)
                  .font({ size: 16, weight: 500 })
                  .fontColor($r('app.color.font_primary'))
                Text('起')
                  .fontSize(12)
                  .fontColor($r('app.color.font_tertiary'))
              }
              .alignItems(VerticalAlign.Bottom)
              .margin({ top: 6 })
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
            .padding(10)
          }
          .backgroundColor($r('app.color.background_primary'))
          .borderRadius(10)
        }
        .width('100%')

        FlowItem(){
          Column(){
            Image($r('app.media.goods2'))
              .width('100%')
              .borderRadius({ topLeft: 10, topRight: 10 })
            Column(){
              Text('Xiaomi 14')
                .font({ size: 14, weight: 500 })
              Text('徕卡光学Summilux镜头｜小米澎湃OS｜第三代骁龙®8移动平台')
                .font({ size: 12 })
                .fontColor($r('app.color.font_tertiary'))
                .margin({ top: 10 })
              Row(){
                Text(`￥3999`)
                  .font({ size: 16, weight: 500 })
                  .fontColor($r('app.color.font_primary'))
                Text('起')
                  .fontSize(12)
                  .fontColor($r('app.color.font_tertiary'))
              }
              .alignItems(VerticalAlign.Bottom)
              .margin({ top: 6 })
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
            .padding(10)
          }
          .backgroundColor($r('app.color.background_primary'))
          .borderRadius(10)
        }
        .width('100%')

        FlowItem(){
          Column(){
            Image($r('app.media.goods3'))
              .width('100%')
              .borderRadius({ topLeft: 10, topRight: 10 })
            Column(){
              Text('Redmi Note 13 Pro')
                .font({ size: 14, weight: 500 })
              Text('小金刚品质')
                .font({ size: 12 })
                .fontColor($r('app.color.font_tertiary'))
                .margin({ top: 10 })
              Row(){
                Text(`￥1499`)
                  .font({ size: 16, weight: 500 })
                  .fontColor($r('app.color.font_primary'))
                Text('起')
                  .fontSize(12)
                  .fontColor($r('app.color.font_tertiary'))
              }
              .alignItems(VerticalAlign.Bottom)
              .margin({ top: 6 })
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
            .padding(10)
          }
          .backgroundColor($r('app.color.background_primary'))
          .borderRadius(10)
        }
        .width('100%')
      }
      .columnsTemplate("1fr 1fr")
      .columnsGap(10)
      .rowsGap(10)
      .width('100%')
      .margin({ top: 10 })
    }
    .width('100%')
    .padding({ left: 15, right: 15 })
    .alignItems(HorizontalAlign.Start)
    .margin({ top: 15 })
  }
}
