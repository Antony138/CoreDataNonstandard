//
//  SPKPublic.h
//  MoveBandCoreData
//
//  Created by SPK_Antony on 21/03/2017.
//  Copyright © 2017 Spark Technology Inc. All rights reserved.
//

#ifndef SPKPublic_h
#define SPKPublic_h


#endif /* SPKPublic_h */

static NSString *kUserEntityName   = @"SPKUser";

static NSString *kUserNameKey      = @"userName";

static NSString *kPacketEntityName = @"SPKPackets";

static NSString *kDayEntityName    = @"SPKDay";

// 性别
typedef NS_ENUM (int16_t, UserGenderType) {
    UserGenderType_Male   = 0x00,
    UserGenderType_Female = 0x01,
    UserGenderType_unknow = 0x02,
};
