import { BadRequestException, Injectable, InternalServerErrorException, NotFoundException, UnauthorizedException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { JwtService } from '@nestjs/jwt';
import { Repository } from 'typeorm';

import { Auth } from './entities/auth.entity';
import * as bcrypt from 'bcrypt';
import { JWTPayload } from './interfaces/jwt-payload.interface';
import { LoginAuthDto } from './dto/login-auth.dto';
import { RegisterAuthDto } from './dto/register-auth.dto';
import { ValidateEmailDto } from './dto/validate-email-dto';
import { on } from 'events';

@Injectable()
export class AuthService {
  
  constructor(@InjectRepository(Auth) private readonly userRepository: Repository<Auth>, 
              private readonly jwtService: JwtService
            ){}
  
  async login(LoginAuthDto: LoginAuthDto) {
    
    const { correo , contrasenia } = LoginAuthDto;
    const user = await this.userRepository.findOne({ where: { correo } });
    if (!user) throw new BadRequestException('User not found');
    // compare password
    const isMatch = await bcrypt.compare(contrasenia , user.contrasenia);
    if (!isMatch) throw new UnauthorizedException('Invalid credentials');
    return {
      ...user,
      token: this.generateJwt({id: user.id })
    };
    
  }

  async loginActualizado(LoginAuthDto: LoginAuthDto){
    try {
      const { correo , contrasenia } = LoginAuthDto;
      const user = await this.userRepository.findOne({ where: { correo } });
      if (!user) throw new NotFoundException('User not found');
      // compare password
      const isMatch = await bcrypt.compare(contrasenia , user.contrasenia);
      if (!isMatch) throw new UnauthorizedException('Invalid credentials');
      return {
        ...user,
        token: this.generateJwt({id: user.id })
      };

    }catch (error) {
      if (error instanceof NotFoundException) throw new NotFoundException(error.message);
      if (error instanceof UnauthorizedException) throw new UnauthorizedException(error.message);
      console.log('check logs for error'+ error);
      throw new BadRequestException(error.message);
    }
  }

  // create user
  async createUser(registerAuthDto: RegisterAuthDto) {
    
    try {
      
      const {  contrasenia, ci, correo, ...detailsCreateAuthDto } = registerAuthDto;
      
      const emailExists = await this.userRepository.findOne({ where: { correo: correo } });
      if (emailExists) throw new BadRequestException('EMAIL_EXISTS');
      const user = this.userRepository.create({
        ...detailsCreateAuthDto,
        contrasenia: await bcrypt.hash(contrasenia, 10),
        ci,
        correo
      });
      await  this.userRepository.save(user);
      return {
        ...user,
        token: this.generateJwt({id: user.id })
      };

    } catch (error) {
      
      console.log('check logs for error'+ error);
      throw new BadRequestException(error.message);

    }
  }

  private generateJwt(payload: JWTPayload) {
    const token = this.jwtService.sign(payload);
    return token;
  }

  async validateEmail(correo: ValidateEmailDto){
    const { email } = correo;
    const user = await this.userRepository.findOne({ where: { correo:email }});
    console.log(correo);
    if (!user) throw new BadRequestException('EMAIL_NOT_EXISTS');
    return {message:'EMAIL_EXISTS'}
  }

}
