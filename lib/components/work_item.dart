import 'package:flutter/material.dart';
import 'package:flutter_getx_template/common/colors/colors.dart';
import 'package:flutter_getx_template/common/colors/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'icon_text.dart';

class WorkItem extends StatefulWidget {
  const WorkItem({Key? key}) : super(key: key);

  @override
  State<WorkItem> createState() => _WorkItemState();
}

class _WorkItemState extends State<WorkItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.w),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      height: 152.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                "ask登记户口ask的机会" * 2,
                maxLines: 1,
                style: textStyle_1.copyWith(fontWeight: FontWeight.w700),
              )),
              Text("面议",
                  style: textStyle_1.copyWith(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w700)),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Text(
                        '北京市',
                        style: textStyle_2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Text(
                        '全职',
                        style: textStyle_2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Text(
                        '招工人',
                        style: textStyle_2,
                      ),
                    ),
                  ],
                ),
              ),
              Text("今天", style: textStyle_2),
            ],
          ),
          Row(
              children: ['包吃', '包住']
                  .map((e) => Container(
                        padding: EdgeInsets.fromLTRB(8, 5, 8, 5),
                        margin: EdgeInsets.only(right: 10.w),
                        decoration: BoxDecoration(color: AppColors.secGreyText),
                        child: Text(e),
                      ))
                  .toList()),
          Container(
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: AppColors.secGreyText, width: 1.w))),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 10.w,
                  backgroundImage: Image.network(
                          'https://oss.fangjiantech.com/9827fe66cc524f85aa781c50ad4598e5-1663399704170-.jpg')
                      .image,
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '张三',
                        style: textStyle_1.copyWith(fontSize: 12.sp),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Text(
                              '国企',
                              style: textStyle_2.copyWith(fontSize: 11.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Text(
                              '100-499人',
                              style: textStyle_2.copyWith(fontSize: 11.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Text(
                              '建筑公司',
                              style: textStyle_2.copyWith(fontSize: 11.sp),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
                IconText(
                  text: "已实名",
                  icon: Icon(Icons.people),
                  style:
                      TextStyle(color: AppColors.primaryColor, fontSize: 12.sp),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
