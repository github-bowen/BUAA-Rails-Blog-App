namespace :db do

  desc 'Init database with prepared data'

  # TODO: 数据来源(去哪儿网) http://hotel.qunar.com/ + 飞常准
  task init_data: :environment do

    Hotel.insert_all(
      [
        { id: 1, name: "桔子水晶北京王府井大街酒店", types: "高档型", rate: 4, location: "北京市东城区东安门大街18号" },
        { id: 2, name: "北海祥丰嘉年华大酒店", types: "舒适型", rate: 3, location: "广西北海海城区贵州路38号逢时大厦" },
        { id: 3, name: "上海康莱德酒店", types: "豪华型", rate: 5, location: "上海市黄浦区南京东路789号" },
        { id: 4, name: "厦门瑞颐大酒店", types: "豪华型", rate: 5, location: "厦门市思明区鹭江道12号" },
        { id: 5, name: "杭州维多利亚丽嘉酒店(西湖湖滨店)", types: "高档型", rate: 4, location: "杭州市上城区延安路89号" },
      ]
    )

    RoomType.insert_all(
      [
        # 桔子水晶北京王府井大街酒店
        { id: 1, name: "大床房", has_window: false, price: 577, hotel_id: 1 },
        { id: 2, name: "高级大床房", has_window: false, price: 659, hotel_id: 1 },
        { id: 3, name: "商务大床房", has_window: true, price: 659, hotel_id: 1 },
        { id: 4, name: "豪华大床房", has_window: true, price: 675, hotel_id: 1 },

        # 北海祥丰嘉年华大酒店
        { id: 5, name: "标准双人间", has_window: true, price: 260, hotel_id: 2 },
        { id: 6, name: "标准大床房", has_window: true, price: 260, hotel_id: 2 },
        { id: 7, name: "豪华家庭套房", has_window: true, price: 455, hotel_id: 2 },
        { id: 8, name: "中式家庭套房", has_window: true, price: 712, hotel_id: 2 },

        # 上海康莱德酒店
        { id: 9, name: "豪华客房", has_window: true, price: 1536, hotel_id: 3 },
        { id: 10, name: "高层豪华客房", has_window: true, price: 1674, hotel_id: 3 },
        { id: 11, name: "尊贵客房", has_window: true, price: 1836, hotel_id: 3 },
        { id: 11, name: "行政客房", has_window: true, price: 2241, hotel_id: 3 },

        # 厦门瑞颐大酒店
        { id: 12, name: "豪华大床房", has_window: true, price: 943, hotel_id: 4 },
        { id: 13, name: "豪华套房", has_window: true, price: 983, hotel_id: 4 },
        { id: 14, name: "豪华鼓浪屿海景双床房", has_window: true, price: 1068, hotel_id: 4 },
        { id: 14, name: "豪华阳台套房", has_window: true, price: 1252, hotel_id: 4 },

        # 杭州维多利亚丽嘉酒店(西湖湖滨店)
        { id: 15, name: "精选大床房", has_window: true, price: 468, hotel_id: 5 },
        { id: 16, name: "市景双床房", has_window: true, price: 503, hotel_id: 5 },
        { id: 17, name: "单人房", has_window: false, price: 543, hotel_id: 5 },
        { id: 18, name: "商务大床房", has_window: true, price: 674, hotel_id: 5 },
      ]
    )

    AirlineCompany.insert_all(
      [
        { id: 1, name: "春秋航空" },
        { id: 2, name: "海南航空" },
        { id: 3, name: "中国国航" },
        { id: 4, name: "南方航空" },
        { id: 5, name: "吉祥航空" },
        { id: 6, name: "厦门航空" },
        { id: 7, name: "山东航空" },
        { id: 8, name: "首都航空" },
        { id: 9, name: "东方航空" }
      ]
    )

    AirRoute.insert_all(
      [
        { id: 1, from: '哈尔滨', to: '北海', departure_time: '17:10',
          landing_time: '21:50', is_direct: true, airline_company_id: 1 },
        { id: 2, from: '北海', to: '哈尔滨', departure_time: '10:20',
          landing_time: '15:05', is_direct: true, airline_company_id: 1 },
        { id: 3, from: '北京', to: '上海', departure_time: '17:00',
          landing_time: '19:25', is_direct: true, airline_company_id: 6 },
        { id: 4, from: '上海', to: '北京', departure_time: '11:25',
          landing_time: '14:00', is_direct: true, airline_company_id: 4 },
        { id: 5, from: '北京', to: '杭州', departure_time: '07:50',
          landing_time: '10:00', is_direct: true, airline_company_id: 6 },
        { id: 6, from: '杭州', to: '北京', departure_time: '16:40',
          landing_time: '19:00', is_direct: true, airline_company_id: 9 },
        { id: 7, from: '杭州', to: '厦门', departure_time: '15:35',
          landing_time: '17:25', is_direct: true, airline_company_id: 7 },
        { id: 7, from: '厦门', to: '杭州', departure_time: '14:20',
          landing_time: '15:50', is_direct: true, airline_company_id: 7 },
        { id: 8, from: '厦门', to: '北京', departure_time: '22:35',
          landing_time: '01:25', is_direct: true, airline_company_id: 8 },
        { id: 9, from: '北京', to: '厦门', departure_time: '18:15',
          landing_time: '21:25', is_direct: true, airline_company_id: 8 },
      ]
    )

  end

end